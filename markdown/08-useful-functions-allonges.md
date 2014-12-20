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

---

![](https://camo.githubusercontent.com/024cb2754860370eff99cab18a885451422a5e03/687474703a2f2f696d67732e786b63642e636f6d2f636f6d6963732f66756e6374696f6e616c2e706e67)

## Trampolining

Continuation passing style of function as explained in 
[Trampolines in JavaScript via raganwald.com](http://raganwald.com/2013/03/28/trampolines-in-javascript.html)

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

