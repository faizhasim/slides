# Partial Application and Currying

---

![I like Curry... do you? Let's talk curry.](images/curry.jpg)

## Recommended reads

- [Chapter 5 - Higher-Order Functions](http://eloquentjavascript.net/05_higher_order.html) of [Eloquent Javascript](http://eloquentjavascript.net/) - by Marijn Haverbeke
- [JavaScript Allongé](https://leanpub.com/javascript-allonge) - by Reg Braithwaite

---

## Curry

### Revisiting previous equations

- sumOfSquares(x,y) = (x × x) + (y × y)
- (x,y) ⟼ (x × x) + (y × y)
- ((x,y) ⟼ (x × x) + (y × y))(5,2)
- (((x,y) ⟼ (x × x) + (y × y))(5))(2)

---

### sumOfSquares(x,y) = (x × x) + (y × y)

```javascript
var sumOfSquares = function(x, y) {
  return (x × x) + (y × y);
}
```

---

### (x,y) ⟼ (x × x) + (y × y)

```javascript
function(x, y) {
  return (x × x) + (y × y);
}
```

Just a lambda (anonymous function)

---

### Currying?

- Turning `((x,y) ⟼ (x × x) + (y × y))(5,2)` into `(((x,y) ⟼ (x × x) + (y × y))(5))(2)`

- Mathematically, if `ƒ(x,y) = (x × x) + (y × y)`, then:

    h(x) = y ⟼ ƒ(x,y)

---

### Partial application?

`h(x) = y ⟼ ƒ(x,y)`

`h(x)` is a partial application of the full application.

---

### Curry + Partial Application

Using `allong.es` at [allong.es/try](http://allong.es/try/):

```javascript
var curry = allong.es.curry;

var giveGreetingFrom = curry(function(greeter, targetPerson) {
  return greeter + ' is saying "hi" to ' + targetPerson;
})

var giveGreetingFromTom = giveGreetingFrom('Tom');

console.log(giveGreetingFromTom);
// Will return unary partial application function

console.log(giveGreetingFromTom('Bill'));
// Tom is saying "hi" to Bill

console.log(giveGreetingFrom('Tom', 'Bill'));
// Tom is saying "hi" to Bill

console.log(giveGreetingFrom('Tom')('Bill'));
// Tom is saying "hi" to Bill

```


