"use strict";

function addMixin(o, mixin) {

  let oldValue = {};
  return new Proxy(o, {
    get: function(target, property) {
      if (property === '__original') {
        return o;
      }
      if (target.hasOwnProperty(property) === true) {

        return target[property];
      } else if (target.hasOwnProperty(property) === false) {
        oldValue[property] = target[property];
        return mixin[property];
      } else {
        return undefined;
      }
    }
  })
 
}

// A sample mixin.
let PlayableMixin = {
  // Plays a system bell 3 times
  play: function() {
    console.log("\u0007");
    console.log("\u0007");
    console.log("\u0007");
  },
  duration: 100,
};

function Song(name, performer, duration) {
  this.name = name;
  this.performer = performer;
  this.duration = duration;
}
Song.prototype = addMixin(Song.prototype, PlayableMixin);

Song.prototype.display = function() {
  console.log(`Now playing "${this.name}", by ${this.performer}. (${this.duration})`);
}

let s = new Song("Gun Street Girl", "Tom Waits", "4:17");
s.display();
s.play();

console.log(s.duration);

s = s.__original;

console.log(s.play);

