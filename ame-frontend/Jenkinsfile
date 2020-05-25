pipeline {
    agent {
        docker {
            image "ruby:alpine"
        }
    }
    stages {
        stage("Build") {
            steps {
                sh "chmod +x build/alpine.sh"
                sh "./build/alpine.sh"
                sh "bundle install"
            }
        }
        stage("Tests") {
            steps {
                sh "bundle exec cucumber BROWSER=headless"
                cucumber failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', pendingStepsNumber: -1, skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
                slackSend baseUrl: 'https://ame-tech.slack.com/archives/C014XFDJ0QG/', botUser: true, channel: 'https://ame-tech.slack.com/services/B014692BTFX?added=1', iconEmoji: ':rocket', message: '1,2,3 testando, galera...', notifyCommitters: true, teamDomain: 'ame-tech', username: 'luucaas.o.p'
            }
        }
    }
}