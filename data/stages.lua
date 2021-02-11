-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 6,
		multiplier = 25
	}, {
		minlevel = 7,
		maxlevel = 8,
		multiplier = 20
	}, {
		minlevel = 9,
		maxlevel = 200,
		multiplier = 200
	}, {
		minlevel = 201,
		maxlevel = 300,
		multiplier = 150
	}, {
		minlevel = 301,
		maxlevel = 400,
		multiplier = 100
	}, {
		minlevel = 401,
		maxlevel = 500,
		multiplier = 15
	}, {
		minlevel = 501,
		maxlevel = 700,
		multiplier = 5
	}, {
		minlevel = 701,
		multiplier = 2.5
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 150
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 100
	}, {
		minlevel = 81,
		maxlevel = 110,
		multiplier = 60
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 40
	}, {
		minlevel = 126,
		multiplier = 20
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 100
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 70
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 50
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 40
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 30
	}, {
		minlevel = 126,
		multiplier = 20
	}
}
