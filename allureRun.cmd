@chcp 65001

# тестовые настройки:call allure generate --clean .\out\allure .\build\tests\allure -o .\build\allure-report && allure open .\build\allure-report
call allure generate --clean .\out\allure\allure .\out\smoke\allure .\out\syntax-check\allure -o .\out\allure\allure-report && allure open .\out\allure\allure-report
# Для PowerShell: allure generate --clean .\out\allure .\out\smoke\allure .\out\syntax-check\allure -o .\out\allure\allure-report; allure open .\out\allure\allure-report
