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
            allure includeProperties: false, jdk: '', results: [[path: 'out/syntax-check/allure'],[path: 'out/smoke/allure'],[path: 'out/allure'],[path: 'build/tests/allure']]
            junit allowEmptyResults: true, testResults: 'out/syntax-check/junit/junit.xml'
            junit allowEmptyResults: true, testResults: 'out/**/*.xml'
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
        stage("Sozdanie testovoy bazy") {
            steps {
                bat "chcp 65001\n vrunner init-dev --dt C:\\tools\\dt_vygruzki\\course.dt --db-user Administrator --src src/cf" 
            }
        }
        stage("Syntax control") {
            steps {
                bat "chcp 65001\n vrunner syntax-check"
 
            }
        }
        stage("Smoke tests") {
            steps {
                script{
                    try {
                        bat "chcp 65001\n vrunner xunit"
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
                        bat "chcp 65001\n vrunner vanessa"
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
                    bat "${scannerHome}/bin/sonar-scanner -D sonar.login=9fb760acae5fb0999ac11d63347f2be4e64faa58 -D sonar.projectVersion=${BUILD_ID}"
                }  
            }
        }
        stage("Modul tests") {
            steps {
                script{
                    try {
                        bat """chcp 65001
                        call vrunner compileepf tests tests
                        call vrunner xunit --settings ./env-tests.json"""
                    } catch(Exception Exc) {
                         currentBuild.result = 'UNSTABLE'
                    }
                }
 
            }
        }
    }
}
