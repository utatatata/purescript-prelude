"use strict";

var refEq = function(r1) {
  return function(r2) {
    return r1 === r2;
  };
};

exports.eqBooleanImpl = refEq;
exports.eqIntImpl = retEq;
exports.eqNumberImpl = retEq;
exports.eqCharImpl = retEq;
exports.eqStringImpl = retEq;
