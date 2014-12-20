# Why Functional Programming in JS?

---

1. Complexity of States

![It's going to hurt now and tomorrow...](images/going-to-hurt.png)

---

2. Play nice - Now & Future

```javascript
requestBillingDetails(allVendors)
  .then(compose(extractContacts, latePayment))
  .then(sendEmailNotification)
  .catch(ConnectionException, handleConnectionError)
  .catch(handleGenericError);
```
Promise spec (pipelining)


---

3. Scalability and Reusability

- Web workers.
- Function: Do one thing well, without side-effects.

---

4. Still play nice with existing stuff

- Plain old Javascript object

```javascript
var Employee = new function(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Employee.prototype.fullName = fluent(function(){
  return this.firstName + " " + this.lastName;
});

Employee.prototype.applyLeave = fluent(function(from, to) {
  var leaveInfo = LeaveBuilder
    .by(this)
    .from(from)
    .to(to)
    .build();

  LeaveSystem
    .submit(leaveInfo)
    .then(notifyManager());
});
```


