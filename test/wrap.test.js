const test = require('tape');
const {wrap} = require('../dist');

test('wrap', t => {
  t.equal(wrap('foo'), '(foo)');
  t.equal(wrap('foo', '<'), '<foo)');
  t.equal(wrap('foo', '<', '>'), '<foo>');
  t.end();
});
