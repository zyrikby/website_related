# -*- coding: UTF-8 -*-

"""
Description.

Author:       Yury Zhauniarovich
Date created: 23/02/2022
"""


from enum import Enum
from pydantic import BaseModel

class Theme(Enum):
    def __init__(
        self,
        theme_name: str,
        text_primary: str,
        text_secondary: str,
    ) -> None:
        self.theme_name = theme_name
        self.text_primary = text_primary
        self.text_secondary = text_secondary

    LIGHT = ('light', '#text_primary_light', '#text_secondary_light')
    DARK = ('dark', '#text_primary_dark', '#text_primary_dark')


# theme = Theme.DARK
# print('Theme: {0}\n\tprimary text color: {1}\n\tsecondary text color: {2}'.format(
#     theme, theme.text_primary, theme.text_secondary)
# )

class Settings(BaseModel):
    theme: Theme = Theme.LIGHT

# s = Settings()

# print('Theme: {0}\n\tprimary text color: {1}\n\tsecondary text color: {2}'.format(
#     s.theme, s.theme.text_primary, s.theme.text_secondary)
# )

s = Settings(theme='light')

print('Theme: {0}\n\tprimary text color: {1}\n\tsecondary text color: {2}'.format(
    s.theme, s.theme.text_primary, s.theme.text_secondary)
)