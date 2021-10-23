#!/usr/bin/perl

$branch = defined($ARGV[0])?lc($ARGV[0]):'master';
$env_file = 'iiidevops/app.env';
$branch_env_file = "$env_file.$branch";
print("Check branch env_file : [$branch_env_file]..\n");
if (-e $branch_env_file && chk_nonalphanumeric($branch)) {
	$tmpl = `cat $branch_env_file`;
	open(FH, '>', $env_file) or die $!;
	print FH $tmpl;
	close(FH);
	
	$cmd_msg = `cat $env_file`;
	print("\n-----\n$cmd_msg\n-----\n");
}

# check [a-Z][0-9][_-]
sub chk_nonalphanumeric {
	local($p_string) = @_;
	local($t1);
	
	$t1 = $p_string;
	$t1 =~ s/\W//g;
	$p_string =~ s/-//g;
	
	return($t1 eq $p_string);
}