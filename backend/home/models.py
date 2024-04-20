from django.db import models
from django.contrib.auth.models import User


class Photo(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    image = models.ImageField(null=False, blank=False)

    def __str__(self):
        return self.user


class Person(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    thumbnail = models.ImageField(null=False, blank=False)

    def __str__(self):
        return self.user


class PersonGallery(models.Model):
    person = models.ForeignKey(Person, on_delete=models.CASCADE)
    image = models.ImageField(null=False, blank=False)

    def __str__(self):
        return self.person.user

from django.db import models

class FaceCoordinates(models.Model):
    x = models.IntegerField()
    y = models.IntegerField()
    width = models.IntegerField()
    height = models.IntegerField()
    # You can add more fields as needed

    def __str__(self):
        return f"Face Coordinates: ({self.x}, {self.y}), Width: {self.width}, Height: {self.height}"
