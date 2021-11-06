# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class CourseBasic(models.Model):
    course_id = models.IntegerField(primary_key=True)
    course_name = models.CharField(max_length=255)
    course_type = models.IntegerField()
    course_teacher = models.CharField(max_length=255)
    user = models.ForeignKey('UserBasic', models.DO_NOTHING, blank=True, null=True)
    course_city = models.CharField(max_length=255)
    course_deadline = models.DateTimeField()

    class Meta:
        managed = True
        db_table = 'course_basic'


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = True
        db_table = 'django_migrations'


class UserBasic(models.Model):
    user_id = models.IntegerField(primary_key=True)
    user_password = models.CharField(max_length=255)
    is_superuser = models.IntegerField()
    is_teacher = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'user_basic'


class UserMessage(models.Model):
    user = models.OneToOneField(UserBasic, models.DO_NOTHING, primary_key=True)
    user_message = models.CharField(max_length=255, blank=True, null=True)
    user_readornot = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'user_message'


class UserPermission(models.Model):
    user = models.OneToOneField(UserBasic, models.DO_NOTHING, primary_key=True)
    name = models.CharField(max_length=255)
    content = models.IntegerField()
    codename = models.CharField(max_length=255)

    class Meta:
        managed = True
        db_table = 'user_permission'


class UserStudentProfile(models.Model):
    user = models.OneToOneField(UserBasic, models.DO_NOTHING, primary_key=True)
    user_nickname = models.CharField(max_length=255, blank=True, null=True)
    user_email = models.CharField(max_length=255)
    user_phonenumber = models.IntegerField(blank=True, null=True)
    user_sex = models.CharField(max_length=10, blank=True, null=True)
    user_age = models.IntegerField(blank=True, null=True)
    user_city = models.CharField(max_length=255)

    class Meta:
        managed = True
        db_table = 'user_student_profile'


class UserTeacherProfile(models.Model):
    user = models.OneToOneField(UserBasic, models.DO_NOTHING, primary_key=True)
    user_nickname = models.CharField(max_length=255, blank=True, null=True)
    user_email = models.CharField(max_length=255)
    user_phonenumber = models.IntegerField(blank=True, null=True)
    user_sex = models.CharField(max_length=10, blank=True, null=True)
    user_age = models.IntegerField(blank=True, null=True)
    user_city = models.CharField(max_length=255)
    user_subjecttype = models.IntegerField()

    class Meta:
        managed = True
        db_table = 'user_teacher_profile'
        unique_together = (('user', 'user_subjecttype'),)
