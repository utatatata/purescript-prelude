"use strinct";

var unsafeCompareImpl = function(lt) {
  return function(eq) {
    return function(gt) {
      return function(x) {
        return function(y) {
          return x < y ? lt : x == y ? eq : gt;
        };
      };
    };
  };
};

exports.ordBooleanImple = unsafeCompareImpl;
exports.ordIntImple = unsafeCompareImpl;
exports.ordNumberImple = unsafeCompareImpl;
exports.ordCharImple = unsafeCompareImpl;
exports.ordStringImple = unsafeCompareImpl;
