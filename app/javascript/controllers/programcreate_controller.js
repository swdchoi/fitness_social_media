import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["workouttemplate", "exercisetemplate", "workoutcontainer", "workoutindex"]

  addworkout() {
    const template = this.workouttemplateTarget.innerHTML;
    const workoutIndex = this.workoutindexTarget.value;

    const html = template.replaceAll("PROGRAM_INDEX", workoutIndex);
    const wrapper = document.createElement("div");
    wrapper.innerHTML = html;
    wrapper.querySelector('.workoutnumber').value = workoutIndex;
    this.workoutcontainerTarget.appendChild(wrapper);
    this.workoutindexTarget.value = parseInt(workoutIndex) + 1;
  }

  addexercise(e) {
    const workout = e.target.closest(".exercisecontainer");
    const template = this.exercisetemplateTarget.innerHTML;
    const workoutContainer = workout.closest(".workoutcontainer")
    const workoutIndex = workoutContainer?.querySelector(".workoutnumber")?.value
    const exerciseIndexInput = workout.querySelector(".exerciseindex");
    const exerciseIndex = exerciseIndexInput.value;

    const html = template
      .replaceAll("PROGRAM_INDEX", workoutIndex)
      .replaceAll("EXERCISE_INDEX", exerciseIndex);

    const wrapper = document.createElement("div");
    wrapper.innerHTML = html;

    workout.appendChild(wrapper);
    exerciseIndexInput.value = parseInt(exerciseIndex) + 1;
  }

  removeworkout (e) {
    console.log("workout")
    const workout = e.target.closest(".workoutcontainer")
    workout.remove()
  }

  removeexercise (e) {
    console.log("ex")
    const exercise = e.target.closest(".exercise")
    exercise.remove()
  }
}
