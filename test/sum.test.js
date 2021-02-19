const test = require('tape');
const {sum} = require('../dist').math;

test('sum', t => {
  t.true(sum() === 0);
  t.true(sum(1) === 1);
  t.true(sum(1, 2) === 3);
  t.true(sum(1, 2, 3) === 6);
  t.end();
});