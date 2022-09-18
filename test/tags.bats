#!/usr/bin/env bats

@test "list tags" {
  SRC=$BATS_TEST_DIRNAME/fixtures/projects/npm.yml
  ACT=$BATS_TEST_DIRNAME/actual/list_tags
  EXP=$BATS_TEST_DIRNAME/expected/list_tags

  ./bin/seed list_tags $SRC >$ACT

  diff $EXP $ACT
}

@test "list tag actions, enumerated" {
  CFG=$BATS_TEST_DIRNAME/fixtures/config/actions.yml
  EXP=$BATS_TEST_DIRNAME/expected/list_tag_actions_enum
  ACT=$BATS_TEST_DIRNAME/actual/list_tag_actions_enum

  SEED_CONFIG=$CFG ./bin/seed list_actions git >$ACT

  diff $EXP $ACT
}

@test "list tag actions, collected" {
  CFG=$BATS_TEST_DIRNAME/fixtures/config/actions.yml
  SEED_DIR=$BATS_TEST_DIRNAME/fixtures/node
  EXP=$BATS_TEST_DIRNAME/expected/list_tag_actions_collected
  ACT=$BATS_TEST_DIRNAME/actual/list_tag_actions_collected

  SEED_CONFIG=$CFG SEED_PWD=$SEED_DIR \
    ./bin/seed list_actions node \
    >$ACT

  diff $EXP $ACT
}
