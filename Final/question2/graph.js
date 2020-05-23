"use strict";

// Creates a new text display area.
function Display(width, height) {
  this.width = width;
  this.height = height;
  this.clear();
}

// Unsets all points of the graph.
Display.prototype.clear = function() {
  this.graph = [];
  for (let i=0; i<this.height; i++) {
    let row = [];
    row.length = this.width;
    this.graph.push(row);
  }
}

// Sets the specified points of the graph.
Display.prototype.markPoints = function(...args) {
  for (let [x,y] of args) {
    this.graph[y][x] = true;
  }
}

// Sets points randomly according to the specified probability.
Display.prototype.randomFill = function(prob=0.5) {
  for (let i=0; i<this.height; i++) {
    for (let j=0; j<this.width; j++) {
      if (Math.random() < prob) {
        this.graph[i][j] = true;
      } else {
        this.graph[i][j] = false;
      }
    }
  }
}

// Print out the graph.
Display.prototype.render = function() {
  console.log("GRAPH:");
  for (let i=this.height-1; i>=0; i--) {
    let s = "";
    for (let j=0; j<this.width; j++) {
      if (this.graph[i][j] === true) 
        s += 'X';
      else s += '.';
    }
    console.log(s);
  }
}

// Update the graph according to the specified callback function.
Display.prototype.update = function(f) {
     let graph_old = JSON.parse(JSON.stringify(this.graph));

for (let i = 0; i < this.height - 1; i++) {
   for (let j = 0; j < this.width; j++) {
     let sendObject = {
       val: this.graph[i][j],
       i: i,
       j: j,
       graph: graph_old
     }
     this.graph[i][j] = f(sendObject);
   }
 }


}

// Update the graph every 100 milliseconds
Display.prototype.run = function(f) {
  setTimeout(() => {
    //clear the screen
    console.clear();
    this.update(f);
    this.render();

  },100);
}

  
    




module.exports = Display;

