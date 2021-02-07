/**
 * @license MIT
 * @copyright (c) 2021 Julien Gonzalez
 */

const {is_number} = require('./utils');

/** @namespace / */

/**
 * Adds 1 to `x`.
 *
 * @example
 * ```javascript
 * inc(41);
 * //=> 42
 * ```
 *
 * @public
 * @function inc
 * @param {number} x
 * @return {number}
 */
module.exports = x => is_number(x) ? x + 1 : x;
