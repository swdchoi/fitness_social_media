import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sessioncreate"
export default class extends Controller {
  static targets = ["sessiontemplate", "sessioncontainer", "settemplate", "setcontainer", "sessioncount"]
  connect() {
  }

  addsession(){
    const template = this.sessiontemplateTarget.innerHTML;
    const index = this.sessioncountTarget.value
    const html = template.replaceAll("MOVE_INDEX", index)
    const wrapper = document.createElement('div');
    wrapper.innerHTML = html;
  
    this.sessioncontainerTarget.appendChild(wrapper)
    this.sessioncountTarget.value = parseInt(index) + 1;
  }

  addset(e){
    console.log("hi")
    const template = this.settemplateTarget.innerHTML;
    const index = this.sessioncountTarget.value
    const html = template.replaceAll("MOVE_INDEX", index)
    const setting = e.target.closest(`.setting`)
    const container = setting.querySelector(".set")
  
    const wrapper = document.createElement('div');
    wrapper.innerHTML = html;
    if (container) {
      container.appendChild(wrapper);
    }
  }

  createjson(e){
    const workSessions = document.querySelectorAll(".setting")

    workSessions.forEach((session) => {

    const workSets = session.querySelectorAll(".work-set")

    let currentArray = []

    workSets.forEach( (work) => {

      const weight = work.querySelector(".weight-input").value
      const reps = work.querySelector(".reps-input").value

      const workData = {
        weight: weight,
        rep: reps
      }
      currentArray.push(workData)

    })

      const jsontar = session.querySelector(".sets")
      jsontar.value = JSON.stringify(currentArray)

    })
    
  }
}
