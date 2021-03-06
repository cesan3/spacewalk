-- oracle equivalent source sha1 d6f9580f675b178e67b83bbd74032ad5f4277d7f
-- retrieved from ./1239053651/49a123cbe214299834e6ce97b10046d8d9c7642a/schema/spacewalk/oracle/procs/rhn_install_satellite.sql
--
-- Copyright (c) 2008--2010 Red Hat, Inc.
--
-- This software is licensed to you under the GNU General Public License,
-- version 2 (GPLv2). There is NO WARRANTY for this software, express or
-- implied, including the implied warranties of MERCHANTABILITY or FITNESS
-- FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
-- along with this software; if not, see
-- http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
-- 
-- Red Hat trademarks are not licensed under GPLv2. No permission is
-- granted to use or replicate Red Hat trademarks that are incorporated
-- in this software or its documentation. 
--
--
--
--
--

--monitoring stored procedure

create or replace function
rhn_install_satellite
(
    command_instance_id in rhn_command_queue_instances.recid%type,
    satellite_id in rhn_sat_cluster.recid%type
)
returns void
as $$

begin
    insert into rhn_command_queue_execs (
           instance_id,
           netsaint_id,
           target_type)
    values (command_instance_id, satellite_id, 'cluster');
end; $$ language plpgsql;

