/** @namespace / */

/**
 * Wraps `str` between `prefix` and `suffix`.
 *
 * @public
 * @function wrap
 * @param {string} str The string to wrap.
 * @param {string=} prefix The string that goes before `str`. Default "(".
 * @param {string=} suffix The string that goes after `str`. Default ")".
 * @return {string}
 */
module.exports =
  (str, prefix = '(', suffix = ')') =>
    `${prefix}${str}${suffix}`;