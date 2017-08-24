psql -U postgres -d wsdb -a -c "DROP TABLE IF EXISTS twomass_psc"
psql -U postgres -d wsdb -a -f twomass_psc_schema
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bao' ( DELIMITER('|') );"
#rm -fv psc_bao
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_baq' ( DELIMITER('|') );"
#rm -fv psc_baq
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bba' ( DELIMITER('|') );"
#rm -fv psc_bba
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abc' ( DELIMITER('|') );"
#rm -fv psc_abc
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_acd' ( DELIMITER('|') );"
#rm -fv psc_acd
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abz' ( DELIMITER('|') );"
#rm -fv psc_abz
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bbe' ( DELIMITER('|') );"
#rm -fv psc_bbe
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bap' ( DELIMITER('|') );"
#rm -fv psc_bap
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_acc' ( DELIMITER('|') );"
#rm -fv psc_acc
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_baj' ( DELIMITER('|') );"
#rm -fv psc_baj
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bai' ( DELIMITER('|') );"
#rm -fv psc_bai
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bav' ( DELIMITER('|') );"
#rm -fv psc_bav
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aba' ( DELIMITER('|') );"
#rm -fv psc_aba
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aav' ( DELIMITER('|') );"
#rm -fv psc_aav
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aaa' ( DELIMITER('|') );"
#rm -fv psc_aaa
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aax' ( DELIMITER('|') );"
#rm -fv psc_aax
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_baz' ( DELIMITER('|') );"
#rm -fv psc_baz
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bau' ( DELIMITER('|') );"
#rm -fv psc_bau
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aag' ( DELIMITER('|') );"
#rm -fv psc_aag
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bae' ( DELIMITER('|') );"
#rm -fv psc_bae
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aao' ( DELIMITER('|') );"
#rm -fv psc_aao
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aae' ( DELIMITER('|') );"
#rm -fv psc_aae
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aat' ( DELIMITER('|') );"
#rm -fv psc_aat
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_baf' ( DELIMITER('|') );"
#rm -fv psc_baf
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bad' ( DELIMITER('|') );"
#rm -fv psc_bad
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aau' ( DELIMITER('|') );"
#rm -fv psc_aau
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bax' ( DELIMITER('|') );"
#rm -fv psc_bax
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abn' ( DELIMITER('|') );"
#rm -fv psc_abn
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aaj' ( DELIMITER('|') );"
#rm -fv psc_aaj
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aad' ( DELIMITER('|') );"
#rm -fv psc_aad
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bbc' ( DELIMITER('|') );"
#rm -fv psc_bbc
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bar' ( DELIMITER('|') );"
#rm -fv psc_bar
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abj' ( DELIMITER('|') );"
#rm -fv psc_abj
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aaw' ( DELIMITER('|') );"
#rm -fv psc_aaw
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bam' ( DELIMITER('|') );"
#rm -fv psc_bam
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bay' ( DELIMITER('|') );"
#rm -fv psc_bay
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aar' ( DELIMITER('|') );"
#rm -fv psc_aar
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abs' ( DELIMITER('|') );"
#rm -fv psc_abs
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bbd' ( DELIMITER('|') );"
#rm -fv psc_bbd
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aaz' ( DELIMITER('|') );"
#rm -fv psc_aaz
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bbg' ( DELIMITER('|') );"
#rm -fv psc_bbg
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aaq' ( DELIMITER('|') );"
#rm -fv psc_aaq
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abo' ( DELIMITER('|') );"
#rm -fv psc_abo
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aas' ( DELIMITER('|') );"
#rm -fv psc_aas
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bag' ( DELIMITER('|') );"
#rm -fv psc_bag
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aca' ( DELIMITER('|') );"
#rm -fv psc_aca
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aap' ( DELIMITER('|') );"
#rm -fv psc_aap
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aab' ( DELIMITER('|') );"
#rm -fv psc_aab
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_ace' ( DELIMITER('|') );"
#rm -fv psc_ace
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abg' ( DELIMITER('|') );"
#rm -fv psc_abg
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aam' ( DELIMITER('|') );"
#rm -fv psc_aam
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abx' ( DELIMITER('|') );"
#rm -fv psc_abx
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abd' ( DELIMITER('|') );"
#rm -fv psc_abd
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abr' ( DELIMITER('|') );"
#rm -fv psc_abr
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abv' ( DELIMITER('|') );"
#rm -fv psc_abv
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abp' ( DELIMITER('|') );"
#rm -fv psc_abp
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bak' ( DELIMITER('|') );"
#rm -fv psc_bak
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aaf' ( DELIMITER('|') );"
#rm -fv psc_aaf
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bbb' ( DELIMITER('|') );"
#rm -fv psc_bbb
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bbi' ( DELIMITER('|') );"
#rm -fv psc_bbi
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bat' ( DELIMITER('|') );"
#rm -fv psc_bat
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bbh' ( DELIMITER('|') );"
#rm -fv psc_bbh
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bac' ( DELIMITER('|') );"
#rm -fv psc_bac
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abi' ( DELIMITER('|') );"
#rm -fv psc_abi
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abw' ( DELIMITER('|') );"
#rm -fv psc_abw
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aal' ( DELIMITER('|') );"
#rm -fv psc_aal
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_acb' ( DELIMITER('|') );"
#rm -fv psc_acb
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abk' ( DELIMITER('|') );"
#rm -fv psc_abk
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abm' ( DELIMITER('|') );"
#rm -fv psc_abm
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aai' ( DELIMITER('|') );"
#rm -fv psc_aai
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abh' ( DELIMITER('|') );"
#rm -fv psc_abh
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bab' ( DELIMITER('|') );"
#rm -fv psc_bab
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_ban' ( DELIMITER('|') );"
#rm -fv psc_ban
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abf' ( DELIMITER('|') );"
#rm -fv psc_abf
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aby' ( DELIMITER('|') );"
#rm -fv psc_aby
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abu' ( DELIMITER('|') );"
#rm -fv psc_abu
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abe' ( DELIMITER('|') );"
#rm -fv psc_abe
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aah' ( DELIMITER('|') );"
#rm -fv psc_aah
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abb' ( DELIMITER('|') );"
#rm -fv psc_abb
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aan' ( DELIMITER('|') );"
#rm -fv psc_aan
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abq' ( DELIMITER('|') );"
#rm -fv psc_abq
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bah' ( DELIMITER('|') );"
#rm -fv psc_bah
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bbf' ( DELIMITER('|') );"
#rm -fv psc_bbf
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aac' ( DELIMITER('|') );"
#rm -fv psc_aac
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_baw' ( DELIMITER('|') );"
#rm -fv psc_baw
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abt' ( DELIMITER('|') );"
#rm -fv psc_abt
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_abl' ( DELIMITER('|') );"
#rm -fv psc_abl
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_baa' ( DELIMITER('|') );"
#rm -fv psc_baa
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bas' ( DELIMITER('|') );"
#rm -fv psc_bas
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aak' ( DELIMITER('|') );"
#rm -fv psc_aak
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_bal' ( DELIMITER('|') );"
#rm -fv psc_bal
psql -U postgres -d wsdb -a -c "COPY twomass_psc FROM '/goto-db/catalogs/twomass.psc/psc_aay' ( DELIMITER('|') );"
#rm -fv psc_aay
psql -U postgres -d wsdb -a -c "GRANT SELECT ON TABLE twomass_psc TO goto;"
