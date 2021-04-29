# from django.db import models
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import declarative_base
Base = declarative_base()

class Contact(Base):
    __tablename__ = 'contact'
    id = Column(Integer, primary_key=True)
    name = Column(String, nullable=False)
    genter = Column(String, nullable=True)
    phone = Column(String, nullable=True)
    email = Column(String, nullable=True)
    def __repr__(self):
        return f"Contact(id={self.id!r}, name={self.name!r}, gender={self.gender!r}), phone={self.phone!r}, email={self.email!r}))"