-- 규정책 삭제 시 이를 참조하는 증빙서류/그룹 활성 규정책이 FK 위반으로 삭제를 막지 않도록 SET NULL 처리
-- (업로드 시 그룹 활성 규정책 자동 지정 → evidence.policy_id 가 채워지기 시작하므로 필요)

ALTER TABLE evidence DROP CONSTRAINT IF EXISTS evidence_policy_id_fkey;
ALTER TABLE evidence
    ADD CONSTRAINT evidence_policy_id_fkey FOREIGN KEY (policy_id) REFERENCES policy(id) ON DELETE SET NULL;

ALTER TABLE groups DROP CONSTRAINT IF EXISTS groups_active_policy_id_fkey;
ALTER TABLE groups
    ADD CONSTRAINT groups_active_policy_id_fkey FOREIGN KEY (active_policy_id) REFERENCES policy(id) ON DELETE SET NULL;
