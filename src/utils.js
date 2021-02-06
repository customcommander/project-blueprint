/** @namespace /helpers/types */

/**
 * True if `x` is a string.
 * @public
 * @function is_string
 * @param {*} x
 * @return {boolean}
 */
const is_string = x => typeof x === 'string';

/**
 * True if `x` is a number.
 *
 * @example
 * ```javascript
 * is_number(42);
 * //=> true
 * ```
 *
 * @example
 * > Doesn't work with object-wrapped numbers!
 *
 * ```javascript
 * is_number(new Number(42));
 * //=> false
 * ```
 * @public
 * @function is_number
 * @param {*} x
 * @return {boolean}
 */
const is_number = x => typeof x === 'number';

module.exports = {
  is_number,
  is_string
};
