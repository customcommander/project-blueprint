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
   * add(1, 2);
   * //=> 3
   * ```
   *
   * @public
   * @param {number} a
   * @param {number} b
   * @return {number}
   */
  add: curry((a, b) => a + b)
};