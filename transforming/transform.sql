create table low_effective_scores as select hospital_name, state, measure_id, cast(score as int) as score_int from effective_care where measure_id in ('ED_1b', 'ED_2b', 'OP_1', 'OP_3b', 'OP_18b', 'OP_20', 'OP_21', 'OP_22', 'PC_01');

create table high_effective_scores as select hospital_name, state, measure_id, cast(score as int) as score_int from effective_care where measure_id in ('AMI_2', 'AMI_7a', 'AMI_8a', 'AMI_10', 'CAC_1', 'CAC_2', 'CAC_3', 'HF_1', 'HF_2', 'HF_3', 'IMM_2', 'IMM_3', 'OP_2', 'OP_4', 'OP_5', 'OP_6', 'OP_7', 'OP_23', 'SCIP_Inf_1', 'SCIP_Inf_2', 'SCIP_Inf_3', 'SCIP_Inf_4', 'SCIP_Inf_9', 'SCIP_Inf_10', 'SCIP_VTE_2', 'STK_1', 'STK_2', 'STK_3', 'STK_4', 'STK_5', 'STK_6', 'STK_8', 'STK_10', 'VTE_1', 'VTE_2', 'VTE_3', 'VTE_4', 'VTE_5', 'VTE_6');

create table low_readmission_scores as select hospital_name, state, measure_id, cast(score as int) as score_int from readmissions where measure_id != 'OP_9';

create table high_effective_scores_percentiles as select *, percent_rank() over ( partition by measure_id order by score_int) as percent from high_effective_scores where score_int >=0;

create table low_effective_scores_percentiles as select *, percent_rank() over ( partition by measure_id order by score_int desc) as percent from low_effective_scores where score_int >=0;

create table low_readmission_scores_percentiles as select *, percent_rank() over ( partition by measure_id order by score_int desc) as percent from low_readmission_scores where score_int >=0;

create table rating as select hospital_name, cast(hcahp_case_score+hcahps_consistency_score as int) as overall_score from responses;
