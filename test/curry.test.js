const test = require('tape');
const {curry} = require('../dist');

test('curry', t => {
  const add3 = curry((a, b, c) => a + b + c);
  t.true('function' === typeof add3());
  t.true('function' === typeof add3()(1));
  t.true('function' === typeof add3()(1)());
  t.true('function' === typeof add3()(1)()(2));
  t.true('function' === typeof add3(1)()(2));
  t.true('function' === typeof add3(1)()(2)());
  t.true(6 === add3(1)()(2)()(3));
  t.end();
});
