from django.contrib.auth.models import User, Group
from AgendaContatosBackend.models.Contact import Contact
from rest_framework import viewsets
from rest_framework import permissions
from AgendaContatosBackend.modules.serializers import UserSerializer, GroupSerializer, ContactSerializer


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAuthenticated]


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer
    permission_classes = [permissions.IsAuthenticated]

class ContactViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows contacts to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = ContactSerializer