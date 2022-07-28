from django.urls import path
from enterprise.users.views import UsersListViewSet

urlpatterns = [
    path('users/', UsersListViewSet.as_view({'get': 'list'})
),
]
