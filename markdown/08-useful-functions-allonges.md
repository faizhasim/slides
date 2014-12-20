# Useful functions allong.es

---

Shamelessly taken from [allong.es/try](http://allong.es/try/).

## Fluent

```javascript
var fluent = allong.es.fluent;
    
Role = function () {};

Role.prototype.set = fluent( function (property, name) { 
  this[property] = name 
});

var doomed = new Role()
  .set('name', "Fredo")
  .set('relationship', 'brother')
  .set('parts', ['I', 'II']);
  
doomed
  //=> {"name":"Fredo","relationship":"brother","parts":["I","II"]}
```


## Once

```javascript
var once = allong.es.once;
    
var message = once( function () { return "Hello, it's me"; });

message()
  //=> "Hello, it's me"
message()
  //=> undefined
message()
  //=> undefined
message()
  //=> undefined
```

Also available with `underscore`.


## Trampolining

Stack-friendly recursion.

```javascript
var trampoline = allong.es.trampoline,
    tailCall = allong.es.tailCall;
    
function factorial (n) {
  var _factorial = trampoline( function myself (acc, n) {
    return n > 0
      ? tailCall(myself, acc * n, n - 1)
      : acc
  });
  
  return _factorial(1, n);
};

factorial(10);
  //=> 3628800
```

