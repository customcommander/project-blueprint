/** @namespace /helpers/types */

/**
 * @public
 * @function is_string
 * @param {*} x
 * @return {boolean}
 */
const is_string = x => typeof x === 'string';

/**
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
