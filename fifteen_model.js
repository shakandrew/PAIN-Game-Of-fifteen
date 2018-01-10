var basic_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];

function randomInt(start, end) {
  return Math.floor(Math.random() * (end - start) + start);
}
Array.prototype.swap = function(x, y) {
  var b = this[x];
  this[x] = this[y];
  this[y] = b;
  return this;
}
Array.prototype.randFill = function(start, end, randOper) {
  for (var i = 0; i < randOper; ++i)
    this.swap(randomInt(start, end), randomInt(start, end))
}
Array.prototype.swapWithZero = function(i) {
  var temp = [-4, -1, 1, 4];
  for (var j = 0; j < 4; ++j) {
    if (i + temp[j] >= 0 && i + temp[j] < 16 && this[i + temp[j]] === 0) {
      this.swap(i, i + temp[j]);
      break;
    }
  }
  return this.checkForWin();
}
Array.prototype.checkForWin = function() {
    for (var i = 0; i < 16; ++i ) {
        if ( this[i] !== basic_array[i])
            return false;
    }
    return true;
}

function CreateModel() {
  var obj = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0];
  obj.randFill(0, 16, 5000);
  return obj;
}
