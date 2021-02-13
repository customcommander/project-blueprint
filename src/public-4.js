const {curry} = require('./public-2');

/**
 * @namespace
 * @alias math
 */
module.exports = {

  /**
   * Adds `a` and `b`.
   *
   * @example
   * ```javascript
   * const add = curry((a, b) => a + b);
   * add(1, 2);
   * //=> 3
   * add(1)(2);
   * //=> 3
   *
   * const add10 = add(10);
   * add10(5);
   * //=> 15
   * ```
   *
   * @public
   * @param {number} a
   * @param {number} b
   * @return {number}
   */
  add: curry((a, b) => a + b)
};