from django.db import models

# Create your models here.
class login_table(models.Model):
    username=models.CharField(max_length=30)
    password=models.CharField(max_length=30)
    type=models.CharField(max_length=30)

class user_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    firstname=models.CharField(max_length=80)
    lastname=models.CharField(max_length=80)
    phone=models.BigIntegerField()
    email=models.CharField(max_length=80)
    place=models.CharField(max_length=80)
    post=models.CharField(max_length=80)
    pin=models.IntegerField()
    #usr
    #pswd

class drowsiness_table(models.Model):
    USER=models.ForeignKey(user_table,on_delete=models.CASCADE)
    status = models.CharField(max_length=80)

    image=models.FileField()
    date=models.CharField(max_length=30)


class music_table(models.Model):
    music = models.FileField()
    singer = models.CharField(max_length=80)
    year=models.TextField()
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)


class playlist_table(models.Model):
    MUSIC=models.ForeignKey(music_table,on_delete=models.CASCADE)
    USER=models.ForeignKey(user_table, on_delete=models.CASCADE)


