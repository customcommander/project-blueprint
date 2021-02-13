const test = require('tape');
const {add: sut} = require('../dist').math;

test('add two numbers', t => {
  t.true(sut(1, 2) === 3, 'add two numbers');
  t.true(sut(1)()()(2) === 3, 'add is curried');
  t.end();
});
