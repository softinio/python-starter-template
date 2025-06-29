import pytest
from pai.main import main

def test_main():
    assert main() == True
