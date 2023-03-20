SELECT
td.target_type,
act.assay_id,
ass.confidence_score,
act.activity_comment, 
act.standard_units,
act.standard_value,
act.standard_type,
act.standard_relation,
td.pref_name,
td.chembl_id,  
td.organism, 
cs.canonical_smiles
FROM target_dictionary td
JOIN assays ass ON td.tid = ass.tid
JOIN activities act ON ass.assay_id = act.assay_id
JOIN molecule_dictionary md ON act.molregno = md.molregno
JOIN compound_structures cs ON cs.molregno = md.molregno
JOIN organism_class oc ON td.tax_id = oc.tax_id
AND td.organism = 'Homo sapiens'
AND ass.confidence_score IN (6,7,8,9)
AND ( (act.activity_comment IN ("Active", "active", "inactive", "Not Active", "Not Active (inhibition < 50% 10 uM and thus dose-response curve not measured)"))
OR ( (act.standard_units = "nM") OR (act.standard_relation IN (">", ">=", "<", "<=", "=", "~")) AND (act.standard_value IS NOT NULL)) );

SELECT
td.target_type,
act.assay_id,
ass.confidence_score,
act.activity_comment, 
act.standard_units,
act.standard_value,
act.standard_type,
act.standard_relation,
td.pref_name,
td.chembl_id,  
td.organism, 
cs.canonical_smiles
FROM target_dictionary td
JOIN assays ass ON td.tid = ass.tid
JOIN activities act ON ass.assay_id = act.assay_id
JOIN molecule_dictionary md ON act.molregno = md.molregno
JOIN compound_structures cs ON cs.molregno = md.molregno
JOIN organism_class oc ON td.tax_id = oc.tax_id
AND oc.L1 = 'Bacteria'
AND ass.confidence_score IN (6,7,8,9)
AND ( (act.activity_comment IN ("Active", "active", "inactive", "Not Active", "Not Active (inhibition < 50% 10 uM and thus dose-response curve not measured)"))
OR ( (act.standard_units = "nM") OR (act.standard_relation IN (">", ">=", "<", "<=", "=", "~")) AND (act.standard_value IS NOT NULL)) );
