# Imperative vs Functional

## Example data

```javascript
var subsribersOfSocialMedias = [{
  serviceName: 'facebook',
  count: 35433,
  hasOfficalSupport: true
}, {
  serviceName: 'twitter',
  count: 25433,
  hasOfficalSupport: true
}, {
  serviceName: 'instagram',
  count: 2348,
  hasOfficalSupport: false
}];
```

Should give total count of `63214`.

----

```javascript

var total = 0;
for (var i = 0; i < subsribersOfSocialMedias.length; i++) {
  total += subsribersOfSocialMedias[i].count;
}

console.log(total);
```

Imperative approach...

---

```javascript
var subsriberCount = function(subsriberInfo) {
  return subsriberInfo.count;
}

var accumulate = function(previousValue, currentValue) {
  return previousValue + currentValue;
}

var total = subsribersOfSocialMedias
              .map(subsriberCount)
              .reduce(accumulate);

console.log(total);
```

Functional approach...


---

```javascript
var withOfficialSupport = function(officiallySupported) {
  return function(subsriberInfo) {
    return subsriberInfo.hasOfficalSupport === officiallySupported;
  }
}

var total = subsribersOfSocialMedias
              .filter(withOfficialSupport(true))
              .map(subsriberCount)
              .reduce(accumulate);
```

And, to filter by the officially supported social medias.


---

Exact same code with [CoffeeScript](http://coffeescript.org/):

![](images/coffee-script.png)

```coffeescript
subsriberCount = (subsriberInfo) -> subsriberInfo.count

withOfficialSupport = (officiallySupported) -> 
    (subsriberInfo) -> 
        subsriberInfo.hasOfficalSupport is officiallySupported


total = subsribersOfSocialMedias
          .filter (withOfficialSupport true)
          .map subsriberCount
          .reduce ((a,b) -> a + b)
```

---

Wait, what about ECMAScript 6?

![](images/ecmascript6-javascript.png)

```javascript
var subsriberCount = (subsriberInfo) => subsriberInfo.count

var withOfficialSupport = (officiallySupported) => (subsriberInfo) => {
  return subsriberInfo.hasOfficalSupport === officiallySupported
}

let total = subsribersOfSocialMedias
            .filter(withOfficialSupport(true))
            .map(subsriberCount)
            .reduce((a,b) => a + b)
```

> CoffeeScript influenced TC-39 decision making.


---

- [Array#reduce](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)
- [Array#map](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
- [Array#filter](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)
- [Array#forEach](https://developer.mozilla.org/en/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)

![All modern browsers (≥ IE 9)](images/no-ie9.jpg)


---

![Should we continue?](images/so-much-fun.jpg)