from django.contrib.auth.models import User, Group
from rest_framework import serializers
from AgendaContatosBackend.models import Contact

class UserSerializer(serializers.HyperlinkedModelSerializer):
    url = serializers.HyperlinkedRelatedField(
        view_name='users:detail',
        read_only=True
    )
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']

class GroupSerializer(serializers.HyperlinkedModelSerializer):
    url = serializers.HyperlinkedRelatedField(
        view_name='groups:detail',
        read_only=True
    )
    class Meta:
        model = Group
        fields = ['url', 'name']

class ContactSerializer(serializers.HyperlinkedModelSerializer):
    url = serializers.HyperlinkedRelatedField(
        view_name='contacts:detail',
        read_only=True
    )
    class Meta:
        model = Contact
        fields = ['url', 'id', 'name', 'gender', 'phone', 'email']
        lookup_field = 'name'
