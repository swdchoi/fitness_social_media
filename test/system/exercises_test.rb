require "application_system_test_case"

class ExercisesTest < ApplicationSystemTestCase
  setup do
    @exercise = exercises(:one)
  end

  test "visiting the index" do
    visit exercises_url
    assert_selector "h1", text: "Exercises"
  end

  test "should create exercise" do
    visit exercises_url
    click_on "New exercise"

    fill_in "Name", with: @exercise.name
    fill_in "R1", with: @exercise.r1
    fill_in "R2", with: @exercise.r2
    fill_in "R3", with: @exercise.r3
    fill_in "R4", with: @exercise.r4
    fill_in "R5", with: @exercise.r5
    fill_in "R6", with: @exercise.r6
    fill_in "Sets", with: @exercise.sets
    fill_in "Workout", with: @exercise.workout_id
    click_on "Create Exercise"

    assert_text "Exercise was successfully created"
    click_on "Back"
  end

  test "should update Exercise" do
    visit exercise_url(@exercise)
    click_on "Edit this exercise", match: :first

    fill_in "Name", with: @exercise.name
    fill_in "R1", with: @exercise.r1
    fill_in "R2", with: @exercise.r2
    fill_in "R3", with: @exercise.r3
    fill_in "R4", with: @exercise.r4
    fill_in "R5", with: @exercise.r5
    fill_in "R6", with: @exercise.r6
    fill_in "Sets", with: @exercise.sets
    fill_in "Workout", with: @exercise.workout_id
    click_on "Update Exercise"

    assert_text "Exercise was successfully updated"
    click_on "Back"
  end

  test "should destroy Exercise" do
    visit exercise_url(@exercise)
    click_on "Destroy this exercise", match: :first

    assert_text "Exercise was successfully destroyed"
  end
end
