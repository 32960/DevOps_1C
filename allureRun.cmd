@chcp 65001

call allure generate --clean .\build\allure .\build\tests\allure -o .\build\allure-report && allure open .\build\allure-report
# Для дымовых тестов: call allure generate --clean .\out\allure .\out\smoke\allure .\out\syntax-check\allure -o .\out\allure\allure-report && allure open .\out\allure\allure-report
# Для PowerShell: allure generate --clean .\out\allure .\out\smoke\allure .\out\syntax-check\allure -o .\out\allure\allure-report; allure open .\out\allure\allure-report
