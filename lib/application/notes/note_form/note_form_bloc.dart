import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ddd_notes/domain/notes/i_note_repository.dart';
import 'package:ddd_notes/domain/notes/note.dart';
import 'package:ddd_notes/domain/notes/note_failure.dart';
import 'package:ddd_notes/domain/notes/value_objects.dart';
import 'package:ddd_notes/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:meta/meta.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(this._noteRepository);

  @override
  NoteFormState get initialState => NoteFormState.initial();

  @override
  Stream<NoteFormState> mapEventToState(
    NoteFormEvent event,
  ) async* {
    yield* event.map(
      initialized: (e) async* {
        yield e.initialNoteOption.fold(
          () => state, // None yields an unchanged state
          // Some Note yields that Note
          // This means it isEditing an existing note
          (initialNote) => state.copyWith(
            note: initialNote,
            isEditing: true,
          ),
        );
      },
      bodyChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(body: NoteBody(e.bodyStr)),
          saveFailureOrSuccessOption: none(),
        );
      },
      colorChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(color: NoteColor(e.color)),
          saveFailureOrSuccessOption: none(),
        );
      },
      todosChanged: (e) async* {
        yield state.copyWith(
          note: state.note.copyWith(
            // Map the primitive to the domain entity
            todos: List3(e.todos.map((primitive) => primitive.toDomain())),
          ),
          saveFailureOrSuccessOption: none(),
        );
      },
      saved: (e) async* {
        Either<NoteFailure, Unit> failureOrSuccess;

        yield state.copyWith(
          isSaving: true,
          saveFailureOrSuccessOption: none(),
        );

        // Create or update the Note
        if (state.note.failureOption.isNone()) {
          failureOrSuccess = state.isEditing
              ? await _noteRepository.update(state.note)
              : await _noteRepository.create(state.note);
        }

        // Start showing the error messages after the first attempt to save
        yield state.copyWith(
          isSaving: false,
          showErrorMessages: true,
          // optionOf will either return the NoteFailure or none (Unit)
          saveFailureOrSuccessOption: optionOf(failureOrSuccess),
        );
      },
    );
  }
}
