from django.db import models

class Category(models.Model):
    name = models.CharField(max_length=255)
    sort = models.IntegerField(default = None, null = True, blank = True)

    # for the admin panel, also to make debugging easier
    def __str__(self):
        return self.name

class Product(models.Model):
    name = models.CharField(max_length=255)
    price = models.IntegerField(default = 0)
    sort = models.IntegerField(default = None, null = True, blank = True)
    category = models.ForeignKey(Category, on_delete=models.CASCADE)
    last_update = models.DateTimeField(auto_now_add=True, blank = True)

    def __str__(self):
        return self.name
