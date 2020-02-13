# Adding a new lesson

1. Create a new class inherited from tt_QuestionSource, if needed.
2. Add this class instance to selectedSource in makeQuestionSource() in tt_player_supervisor.zs.
3. Add this class instance to mixedLesson in makeQuestionSource() in tt_player_supervisor.zs.
4. Mention this lesson in OptionValue tt_QuestionSourceValues in menudef.txt.
5. Mention this lesson in OptionMenu tt_MixedLesson in menudef.txt.
6. If needed, add `tt_is_lesson_enabled_N` cvar in cvarinfo.txt.
