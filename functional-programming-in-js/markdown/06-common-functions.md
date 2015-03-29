# Common Functions

---

Examples are using [Lazy.js](http://danieltao.com/lazy.js/docs/).

> `Sequence`: Represent both Array and Object

## [Map](http://danieltao.com/lazy.js/docs/#Sequence-map) function

> Create new sequence whose elements are calculated from the supplied mapping function.

```javascript
Lazy([1, 2, 3, 4, 5]).map(function(val) {
  return val * val;
}).toArray();

// [1, 4, 9, 16, 25]
```

## [Pluck](http://danieltao.com/lazy.js/docs/#Sequence-pluck) function

> Create new sequence from the key property of of each element in the existing sequence

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

Lazy(subsribersOfSocialMedias).pluck('count').toArray();
// [35433, 25433, 2348]
```

## [Reduce](http://danieltao.com/lazy.js/docs/#Sequence-reduce) function

> Aggregation using an accumulator function

- [Reduce right](http://danieltao.com/lazy.js/docs/#Sequence-reduceRight) also available.
- From previous example:

```javascript
var counts = Lazy(subsribersOfSocialMedias).pluck('count');

counts.reduce(function(x, y) {
  return x + y;
});
// 63214
```

```javascript
counts.reduce(function(x, y) {
  return x + y;
}, 0);
// 63214
```


## [Reject](http://danieltao.com/lazy.js/docs/#Sequence-reject) function

> Exclude elements based on the supplied function

```javascript
var noFacebook = function(obj) {
  if (obj.serviceName === 'facebook') {
    return true;
  }
  return false;
}

Lazy(subsribersOfSocialMedias)
  .reject(noFacebook)
  .toArray();

Lazy(subsribersOfSocialMedias)
  .reject(noFacebook)
  .reject({hasOfficalSupport: true})
  .toArray();
```

## [Sort By](http://danieltao.com/lazy.js/docs/#Sequence-sortBy) function

> Exclude elements based on the supplied function

```javascript
var count = function(obj) {
  return obj.count;
}

Lazy(subsribersOfSocialMedias).sortBy(count).first();
// {serviceName: "instagram", count: 2348, hasOfficalSupport: false}
```


