for host in {aseel,eaccr,pearch,unither,braekel,concerta,changepain,edetailing,epatient-reflux.rb,eric,ght,hematology.janssen,lunchtimelectures,mylunar,path,patient-pathways,procurement-academy,produrement-academy.roche,ridgeway,rocheoncology,rochewall,staging.concerta.janssen,staging.edetailing,eaccr,unither,eric}.incuna.com perchtraining.org;
    do ssh incuna@$host "(hostname; ls /var/www/; echo '')";
    done > sites.txt
