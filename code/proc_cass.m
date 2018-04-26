
th_feature1_3_10_a = csvread('../../experiments/tl/cassandra/feature1/measurements_a.csv',0,6,[0,6,1023,6]);
th_feature1_3_10_b = csvread('../../experiments/tl/cassandra/feature1/measurements_b.csv',0,6,[0,6,1023,6]);

th_feature3_3_10_a = csvread('../../experiments/tl/cassandra/feature3/measurements_a.csv',0,6,[0,6,1023,6]);
th_feature3_3_10_b = csvread('../../experiments/tl/cassandra/feature3/measurements_b.csv',0,6,[0,6,1023,6]);
th_feature3_3_10_c = csvread('../../experiments/tl/cassandra/feature3/measurements_c.csv',0,6,[0,6,1023,6]);
th_feature3_3_10_d = csvread('../../experiments/tl/cassandra/feature3/measurements_d.csv',0,6,[0,6,1023,6]);
th_feature3_3_10_e = csvread('../../experiments/tl/cassandra/feature3/measurements_e.csv',0,6,[0,6,1023,6]);
th_feature3_3_10_f = csvread('../../experiments/tl/cassandra/feature3/measurements_f.csv',0,6,[0,6,1023,6]);

th_feature4_2_2_8_a = csvread('../../experiments/tl/cassandra/feature4/measurements_a.csv',0,6,[0,6,1023,6]);
th_feature4_2_2_8_b = csvread('../../experiments/tl/cassandra/feature4/measurements_b.csv',0,6,[0,6,1023,6]);
th_feature4_2_2_8_c = csvread('../../experiments/tl/cassandra/feature4/measurements_c.csv',0,6,[0,6,1023,6]);
th_feature4_2_2_8_d = csvread('../../experiments/tl/cassandra/feature4/measurements_d.csv',0,6,[0,6,1023,6]);
th_feature4_2_2_8_e = csvread('../../experiments/tl/cassandra/feature4/measurements_e.csv',0,6,[0,6,1023,6]);
th_feature4_2_2_8_f = csvread('../../experiments/tl/cassandra/feature4/measurements_f.csv',0,6,[0,6,1023,6]);

th_feature10_1_2_19_a = csvread('../../experiments/tl/cassandra/feature10/measurements_a.csv',0,6,[0,6,1023,6]);
th_feature10_1_2_19_b = csvread('../../experiments/tl/cassandra/feature10/measurements_b.csv',0,6,[0,6,1023,6]);
th_feature10_1_2_19_c = csvread('../../experiments/tl/cassandra/feature10/measurements_c.csv',0,6,[0,6,1023,6]);
th_feature10_1_2_19_d = csvread('../../experiments/tl/cassandra/feature10/measurements_d.csv',0,6,[0,6,1023,6]);
th_feature10_1_2_19_e = csvread('../../experiments/tl/cassandra/feature10/measurements_e.csv',0,6,[0,6,1023,6]);
th_feature10_1_2_19_f = csvread('../../experiments/tl/cassandra/feature10/measurements_f.csv',0,6,[0,6,1023,6]);


response_index = 7;

% determining source and target

source_hardware = th_feature1_3_10_a;
target_hardware = th_feature3_3_10_a;

source_workload = th_feature3_3_10_a;
target_workload = th_feature3_3_10_b;
source_workload1 = th_feature3_3_10_a;
target_workload1 = th_feature3_3_10_c;
source_workload2 = th_feature3_3_10_a;
target_workload2 = th_feature3_3_10_d;
source_workload3 = th_feature3_3_10_a;
target_workload3 = th_feature3_3_10_e;
source_workload4 = th_feature3_3_10_a;
target_workload4 = th_feature3_3_10_f;

source_version = th_feature3_3_10_a;
target_version = th_feature4_2_2_8_a;
source_version1 = th_feature3_3_10_a;
target_version1 = th_feature10_1_2_19_a;

source_workload_version = th_feature3_3_10_a;
target_workload_version = th_feature10_1_2_19_b;

source_hardware_workload_version = th_feature1_3_10_a;
target_hardware_workload_version = th_feature10_1_2_19_b;

% adding noise
S = RandStream('mt19937ar','Seed',5489);
snr = 20;
source_hardware = awgn(source_hardware, snr, 'measured', S);
source_workload = awgn(source_workload, snr, 'measured', S);
source_workload1 = awgn(source_workload1, snr, 'measured', S);
source_workload2 = awgn(source_workload2, snr, 'measured', S);
source_workload3 = awgn(source_workload3, snr, 'measured', S);
source_workload4 = awgn(source_workload4, snr, 'measured', S);
source_version = awgn(source_version, snr, 'measured', S);
source_version1 = awgn(source_version1, snr, 'measured', S);
source_workload_version = awgn(source_workload_version, snr, 'measured', S);
source_hardware_workload_version = awgn(source_hardware_workload_version, snr, 'measured', S);



percentile = 0.1;

[~,idx_sort_source_hardware] = sort(source_hardware);
[~,idx_sort_target_hardware] = sort(target_hardware);
top_source_hardware = idx_sort_source_hardware(1:round(length(idx_sort_source_hardware)*percentile));
top_target_hardware = idx_sort_target_hardware(1:round(length(idx_sort_target_hardware)*percentile));
top_per_intersect_hardware = length(intersect(top_source_hardware,top_target_hardware))/length(top_target_hardware)
bottom_source_hardware = idx_sort_source_hardware(end-round(length(idx_sort_source_hardware)*percentile):end);
bottom_target_hardware = idx_sort_target_hardware(end-round(length(idx_sort_target_hardware)*percentile):end);
bottom_per_intersect_hardware = length(intersect(bottom_source_hardware,bottom_target_hardware))/length(top_target_hardware)
corr(source_hardware,target_hardware,'type','Spearman')


[~,idx_sort_source_workload] = sort(source_workload);
[~,idx_sort_target_workload] = sort(target_workload);
top_source_workload = idx_sort_source_workload(1:round(length(idx_sort_source_workload)*percentile));
top_target_workload = idx_sort_target_workload(1:round(length(idx_sort_target_workload)*percentile));
top_per_intersect_workload = length(intersect(top_source_workload,top_target_workload))/length(top_target_workload)
bottom_source_workload = idx_sort_source_workload(end-round(length(idx_sort_source_workload)*percentile):end);
bottom_target_workload = idx_sort_target_workload(end-round(length(idx_sort_target_workload)*percentile):end);
bottom_per_intersect_workload = length(intersect(bottom_source_workload,bottom_target_workload))/length(top_target_workload)
corr(source_workload,target_workload,'type','Spearman')


[~,idx_sort_source_workload1] = sort(source_workload1);
[~,idx_sort_target_workload1] = sort(target_workload1);
top_source_workload1 = idx_sort_source_workload1(1:round(length(idx_sort_source_workload1)*percentile));
top_target_workload1 = idx_sort_target_workload1(1:round(length(idx_sort_target_workload1)*percentile));
top_per_intersect_workload1 = length(intersect(top_source_workload1,top_target_workload1))/length(top_target_workload1)
bottom_source_workload1 = idx_sort_source_workload1(end-round(length(idx_sort_source_workload1)*percentile):end);
bottom_target_workload1 = idx_sort_target_workload1(end-round(length(idx_sort_target_workload1)*percentile):end);
bottom_per_intersect_workload1 = length(intersect(bottom_source_workload1,bottom_target_workload1))/length(top_target_workload1)
corr(source_workload1,target_workload1,'type','Spearman')

[~,idx_sort_source_workload2] = sort(source_workload2);
[~,idx_sort_target_workload2] = sort(target_workload2);
top_source_workload2 = idx_sort_source_workload2(1:round(length(idx_sort_source_workload2)*percentile));
top_target_workload2 = idx_sort_target_workload2(1:round(length(idx_sort_target_workload2)*percentile));
top_per_intersect_workload2 = length(intersect(top_source_workload2,top_target_workload2))/length(top_target_workload2)
bottom_source_workload2 = idx_sort_source_workload2(end-round(length(idx_sort_source_workload2)*percentile):end);
bottom_target_workload2 = idx_sort_target_workload2(end-round(length(idx_sort_target_workload2)*percentile):end);
bottom_per_intersect_workload2 = length(intersect(bottom_source_workload2,bottom_target_workload2))/length(top_target_workload2)
corr(source_workload2,target_workload2,'type','Spearman')


[~,idx_sort_source_workload3] = sort(source_workload3);
[~,idx_sort_target_workload3] = sort(target_workload3);
top_source_workload3 = idx_sort_source_workload3(1:round(length(idx_sort_source_workload3)*percentile));
top_target_workload3 = idx_sort_target_workload3(1:round(length(idx_sort_target_workload3)*percentile));
top_per_intersect_workload3 = length(intersect(top_source_workload3,top_target_workload3))/length(top_target_workload3)
bottom_source_workload3 = idx_sort_source_workload3(end-round(length(idx_sort_source_workload3)*percentile):end);
bottom_target_workload3 = idx_sort_target_workload3(end-round(length(idx_sort_target_workload3)*percentile):end);
bottom_per_intersect_workload3 = length(intersect(bottom_source_workload3,bottom_target_workload3))/length(top_target_workload3)
corr(source_workload3,target_workload3,'type','Spearman')

[~,idx_sort_source_workload4] = sort(source_workload4);
[~,idx_sort_target_workload4] = sort(target_workload4);
top_source_workload4 = idx_sort_source_workload4(1:round(length(idx_sort_source_workload4)*percentile));
top_target_workload4 = idx_sort_target_workload4(1:round(length(idx_sort_target_workload4)*percentile));
top_per_intersect_workload4 = length(intersect(top_source_workload4,top_target_workload4))/length(top_target_workload4)
bottom_source_workload4 = idx_sort_source_workload4(end-round(length(idx_sort_source_workload4)*percentile):end);
bottom_target_workload4 = idx_sort_target_workload4(end-round(length(idx_sort_target_workload4)*percentile):end);
bottom_per_intersect_workload4 = length(intersect(bottom_source_workload4,bottom_target_workload4))/length(top_target_workload4)
corr(source_workload4,target_workload4,'type','Spearman')


[~,idx_sort_source_version] = sort(source_version);
[~,idx_sort_target_version] = sort(target_version);
top_source_version = idx_sort_source_version(1:round(length(idx_sort_source_version)*percentile));
top_target_version = idx_sort_target_version(1:round(length(idx_sort_target_version)*percentile));
top_per_intersect_version = length(intersect(top_source_version,top_target_version))/length(top_target_version)
bottom_source_version = idx_sort_source_version(end-round(length(idx_sort_source_version)*percentile):end);
bottom_target_version = idx_sort_target_version(end-round(length(idx_sort_target_version)*percentile):end);
bottom_per_intersect_version = length(intersect(bottom_source_version,bottom_target_version))/length(top_target_version)
corr(source_version,target_version,'type','Spearman')

[~,idx_sort_source_version1] = sort(source_version1);
[~,idx_sort_target_version1] = sort(target_version1);
top_source_version1 = idx_sort_source_version1(1:round(length(idx_sort_source_version1)*percentile));
top_target_version1 = idx_sort_target_version1(1:round(length(idx_sort_target_version1)*percentile));
top_per_intersect_version1 = length(intersect(top_source_version1,top_target_version1))/length(top_target_version1)
bottom_source_version1 = idx_sort_source_version1(end-round(length(idx_sort_source_version1)*percentile):end);
bottom_target_version1 = idx_sort_target_version1(end-round(length(idx_sort_target_version1)*percentile):end);
bottom_per_intersect_version1 = length(intersect(bottom_source_version1,bottom_target_version1))/length(top_target_version1)
corr(source_version1,target_version1,'type','Spearman')

[~,idx_sort_source_workload_version] = sort(source_workload_version);
[~,idx_sort_target_workload_version] = sort(target_workload_version);
top_source_workload_version = idx_sort_source_workload_version(1:round(length(idx_sort_source_workload_version)*percentile));
top_target_workload_version = idx_sort_target_workload_version(1:round(length(idx_sort_target_workload_version)*percentile));
top_per_intersect_workload_version = length(intersect(top_source_workload_version,top_target_workload_version))/length(top_target_workload_version)
bottom_source_workload_version = idx_sort_source_workload_version(end-round(length(idx_sort_source_workload_version)*percentile):end);
bottom_target_workload_version = idx_sort_target_workload_version(end-round(length(idx_sort_target_workload_version)*percentile):end);
bottom_per_intersect_workload_version = length(intersect(bottom_source_workload_version,bottom_target_workload_version))/length(top_target_workload_version)
corr(source_workload_version,target_workload_version,'type','Spearman')

[~,idx_sort_source_hardware_workload_version] = sort(source_hardware_workload_version);
[~,idx_sort_target_hardware_workload_version] = sort(target_hardware_workload_version);
top_source_hardware_workload_version = idx_sort_source_hardware_workload_version(1:round(length(idx_sort_source_hardware_workload_version)*percentile));
top_target_hardware_workload_version = idx_sort_target_hardware_workload_version(1:round(length(idx_sort_target_hardware_workload_version)*percentile));
top_per_intersect_hardware_workload_version = length(intersect(top_source_hardware_workload_version,top_target_hardware_workload_version))/length(top_target_hardware_workload_version)
bottom_source_hardware_workload_version = idx_sort_source_hardware_workload_version(end-round(length(idx_sort_source_hardware_workload_version)*percentile):end);
bottom_target_hardware_workload_version = idx_sort_target_hardware_workload_version(end-round(length(idx_sort_target_hardware_workload_version)*percentile):end);
bottom_per_intersect_hardware_workload_version = length(intersect(bottom_source_hardware_workload_version,bottom_target_hardware_workload_version))/length(top_target_hardware_workload_version)
corr(source_hardware_workload_version,target_hardware_workload_version,'type','Spearman')