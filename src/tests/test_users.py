import pytest

@pytest.mark.django_db
def test(user):
    response = user.get("/users/")
    assert response.data != [], response.data