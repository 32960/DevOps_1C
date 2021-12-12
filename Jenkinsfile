pipeline
{
    agent {
        label 'OneS'
    }
    
    environment {
        envString = 'true'
    }
 
    post {
        always {
            allure includeProperties: false, jdk: '', results: [[path: 'out/syntax-check/allure'], [path: 'out/allure/smoke'], [path: 'out/allure'], [path: 'build/tests/allure']]
            junit allowEmptyResults: true, testResults: 'out/syntax-check/junit/junit.xml'
            junit allowEmptyResults: true, testResults: 'out/*.xml'
            junit allowEmptyResults: true, testResults: 'build/tests/junit/*.xml'
        }
    
        failure {
            bat "echo failure"
        }
        
        success {
            bat "echo success"      
        }
    }
    stages {
        stage("Создание тестовой базы") {
            steps {
                bat "chcp 65001\n vrunner init-dev --dt C:\\tools\\dt_vygruzki\\course.dt --db-user Администратор --src src/cf "
 
            }
        }

    stage("Синтаксический контроль") {
            steps {
                bat "chcp 65001\n vrunner syntax-check"
 
            }
        }


    stage("Дымовые тесты") {
            steps {
                script{
                    try {
                        bat "chcp 65001\n runner xunit"
                    } catch(Exception Exc) {
                         currentBuild.result = 'UNSTABLE'
                    }
                }
 
            }
        }

    stage("Модульные тесты") {
            steps {
                script{
                    try {
                        bat """chcp 65001
                        call vrunner compileepf tests tests
                        call runner xunit --settings ./env-tests.json"""
                    } catch(Exception Exc) {
                         currentBuild.result = 'UNSTABLE'
                    }
                }
 
            }
        }

    stage("vanessa") {
            steps {
                script{
                    try {
                        bat "chcp 65001\n runner vanessa"
                    } catch(Exception Exc) {
                         currentBuild.result = 'UNSTABLE'
                    }
                }
 
            }
        }

    stage("Sonar") {
            steps {
                script{
                       scannerHome = tool 'sonar-scanner'
                }
            withSonarQubeEnv ("sonar") {
                    bat "${scannerHome}/bin/sonar-scanner -D sonar.login=a.zoteev -D sonar.projectVersion=${BUILD_ID}"
                }  
            }
        }

    }
}
