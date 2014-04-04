--
-- FOREIGN key CONSTRAINTS for ICIS DMS tables V5.6/IBDB DMS v1
--
--

ALTER TABLE institut ADD CONSTRAINT FOREIGN KEY institut_ibfk1(instype) REFERENCES udflds(fldno) ON UPDATE CASCADE;
ALTER TABLE institut ADD CONSTRAINT FOREIGN KEY institut_ibfk2(inslocid) REFERENCES location(locid) ON UPDATE CASCADE;
ALTER TABLE institut ADD CONSTRAINT FOREIGN KEY institut_ibfk3(pinsid) REFERENCES institut(institid) ON UPDATE CASCADE;


ALTER TABLE datattr ADD CONSTRAINT FOREIGN KEY datattr_ibfk1(datype) REFERENCES dudflds(fldno) ON UPDATE CASCADE;


ALTER TABLE dmsattr ADD CONSTRAINT FOREIGN KEY dmsattr_ibfk1(dmsatype) REFERENCES dudflds(fldno) ON UPDATE CASCADE;


ALTER TABLE dudflds ADD CONSTRAINT FOREIGN KEY dudflds_ibfk1(fuid) REFERENCES users(userid) ON UPDATE CASCADE;


ALTER TABLE factor ADD CONSTRAINT FOREIGN KEY factor_ibfk1(studyid) REFERENCES study(studyid) ON UPDATE CASCADE;
ALTER TABLE factor ADD CONSTRAINT FOREIGN KEY factor_ibfk2(traitid) REFERENCES tmstraits(traitid) ON UPDATE CASCADE;
ALTER TABLE factor ADD CONSTRAINT FOREIGN KEY factor_ibfk3(scaleid) REFERENCES tmsscales(scaleid) ON UPDATE CASCADE;
ALTER TABLE factor ADD CONSTRAINT FOREIGN KEY factor_ibfk4(tmethid) REFERENCES tmsmethod(tmethid) ON UPDATE CASCADE;
ALTER TABLE factor ADD CONSTRAINT FOREIGN KEY factor_ibfk5(tid) REFERENCES tmstraits(tid) ON UPDATE CASCADE;
ALTER TABLE factor ADD CONSTRAINT FOREIGN KEY factor_ibfk6(traitid) REFERENCES trait(traitid) ON UPDATE CASCADE;



ALTER TABLE obsunit ADD CONSTRAINT FOREIGN KEY obsunit_ibfk1(ounitid) REFERENCES oindex(ounitid) ON UPDATE CASCADE;
ALTER TABLE obsunit ADD CONSTRAINT FOREIGN KEY obsunit_ibfk2(effectid) REFERENCES effect(effectid) ON UPDATE CASCADE;


ALTER TABLE persons ADD CONSTRAINT FOREIGN KEY persons_ibfk1(institid) REFERENCES institut(institid) ON UPDATE CASCADE;

ALTER TABLE personlist ADD CONSTRAINT FOREIGN KEY personlist_ibfk1(personid) REFERENCES persons(personid) ON UPDATE CASCADE;


ALTER TABLE project ADD CONSTRAINT FOREIGN KEY project_ibfk1(projectfundingbody) REFERENCES institut(institid) ON UPDATE CASCADE;
ALTER TABLE project ADD CONSTRAINT FOREIGN KEY project_ibfk2(projectfocusregion) REFERENCES location(locid) ON UPDATE CASCADE;
ALTER TABLE project ADD CONSTRAINT FOREIGN KEY project_ibfk3(projectuid) REFERENCES users(userid) ON UPDATE CASCADE;
ALTER TABLE project ADD CONSTRAINT FOREIGN KEY project_ibfk4(projectlocn) REFERENCES location(locid) ON UPDATE CASCADE;
ALTER TABLE project ADD CONSTRAINT FOREIGN KEY project_ibfk5(projectprincipal) REFERENCES persons(personid) ON UPDATE CASCADE;
ALTER TABLE project ADD CONSTRAINT FOREIGN KEY project_ibfk6(projectref) REFERENCES bibrefs(refid) ON UPDATE CASCADE;



ALTER TABLE represtn ADD CONSTRAINT FOREIGN KEY represtn_ibfk1(effectid) REFERENCES effect(effectid) ON UPDATE CASCADE;


ALTER TABLE scalecon ADD CONSTRAINT FOREIGN KEY scalecon_ibfk1(scaleid) REFERENCES scale(scaleid) ON UPDATE CASCADE;


ALTER TABLE scaledis ADD CONSTRAINT FOREIGN KEY scaledis_ibfk1(scaleid) REFERENCES scale(scaleid) ON UPDATE CASCADE;


ALTER TABLE steffect ADD CONSTRAINT FOREIGN KEY steffect_ibfk1(effectid) REFERENCES effect(effectid) ON UPDATE CASCADE;
ALTER TABLE steffect ADD CONSTRAINT FOREIGN KEY steffect_ibfk2(studyid) REFERENCES study(studyid) ON UPDATE CASCADE;



ALTER TABLE tmsmeasuredin ADD CONSTRAINT FOREIGN KEY tmsmeasuredin_ibfk1(scaleid) REFERENCES tmsscales(scaleid) ON UPDATE CASCADE;


ALTER TABLE variate ADD CONSTRAINT FOREIGN KEY variate_ibfk1(studyid) REFERENCES study(studyid) ON UPDATE CASCADE;
ALTER TABLE variate ADD CONSTRAINT FOREIGN KEY variate_ibfk2(traitid) REFERENCES tmstraits(traitid) ON UPDATE CASCADE;
ALTER TABLE variate ADD CONSTRAINT FOREIGN KEY variate_ibfk3(scaleid) REFERENCES tmsscales(scaleid) ON UPDATE CASCADE;
ALTER TABLE variate ADD CONSTRAINT FOREIGN KEY variate_ibfk4(tmethid) REFERENCES tmsmethod(tmethid) ON UPDATE CASCADE;
ALTER TABLE variate ADD CONSTRAINT FOREIGN KEY variate_ibfk5(tid) REFERENCES tmstraits(tid) ON UPDATE CASCADE;
ALTER TABLE variate ADD CONSTRAINT FOREIGN KEY variate_ibfk6(traitid) REFERENCES trait(traitid) ON UPDATE CASCADE;



















































