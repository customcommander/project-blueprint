const {is_number} = require('./private');

const inc = x => is_number(x) ? x + 1 : x;
const dec = x => is_number(x) ? x - 1 : x;
const sum = (...xs) => xs.reduce((y, x) => y + x, 0);

/**
 * @namespace
 * @alias math
 */
module.exports = {

  /**
   * Adds 1 to `x`.
   *
   * @public
   * @function
   * @param {number} x
   * @return {number}
   */
  inc,

  /**
   * Takes 1 away from `x`.
   *
   * @public
   * @function
   * @param {number} x
   * @return {number}
   */
  dec,

  /**
   * Adds all numbers together.
   *
   * @example
   * ```javascript
   * sum();
   * //=> 0
   * sum(1);
   * //=> 1
   * sum(1, 2);
   * //=> 3
   * sum(1, 2, 3);
   * //=> 6
   * ```
   *
   * @public
   * @function
   * @param {...number} x A list of numbers
   * @return {number}
   */
  sum
};
