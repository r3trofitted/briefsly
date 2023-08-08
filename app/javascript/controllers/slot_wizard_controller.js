import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slot-wizard"
export default class extends Controller {
  static targets = [ "query", "step2", "step3" ];
  
  connect() {
  }
  
  searchRepositories(e) {
    console.log("SearchRepositories with", e);
    
    const q = this.queryTarget.value;
    
    fetch(`/repositories?${new URLSearchParams({ q })}`, {
      headers: {
        "Content-Type": "text/vnd.turbo-stream.html",
        "Accept": "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html));
  }
  
  moveToStep2(e) {
    const repo = e.target.value;
    
    console.log("Moving to step 2", repo);
    fetch(`/repositories/${encodeURIComponent(repo)}/issues`, {
      headers: {
        "Content-Type": "text/vnd.turbo-stream.html",
        "Accept": "text/vnd.turbo-stream.html"
      }
    })
    .then(response => response.text())
    .then(html => Turbo.renderStreamMessage(html));
  }
  
  moveToStep3(e) {
    console.log("Move to step 3");
  }
}
